local Notifier = require "overseer.notifier"
local constants = require "overseer.constants"
local util = require "overseer.util"
local overseer = require "overseer"

local STATUS = constants.STATUS

---@type overseer.ComponentFileDefinition
return {
  desc = "vim.notify task result with duration and open overseer on failure",

  params = {
    statuses = {
      desc = "List of statuses to notify on",
      type = "list",
      subtype = {
        type = "enum",
        choices = STATUS.values,
      },
      default = {
        STATUS.FAILURE,
        STATUS.SUCCESS,
      },
    },

    system = {
      desc = "When to send a system notification",
      type = "enum",
      choices = { "always", "never", "unfocused" },
      default = "never",
    },

    on_change = {
      desc = "Only notify when task status changes from previous value",
      type = "boolean",
      default = false,
    },

    open_on_failure = {
      desc = "Open overseer when task fails",
      type = "boolean",
      default = true,
    },
  },

  constructor = function(params)
    if type(params.statuses) == "string" then params.statuses = { params.statuses } end

    local lookup = util.list_to_map(params.statuses)

    return {
      last_status = nil,

      start_time = nil,

      notifier = Notifier.new {
        system = params.system,
      },

      on_init = function(self, task) self.start_time = vim.loop.hrtime() end,

      on_complete = function(self, task, status)
        if not lookup[status] then return end

        if params.on_change then
          if status == self.last_status then return end
          self.last_status = status
        end

        local elapsed = 0

        if self.start_time then elapsed = (vim.loop.hrtime() - self.start_time) / 1e9 end

        local level = util.status_to_log_level(status)

        local message = string.format("%s %s (%.2fs)", status, task.name, elapsed)

        self.notifier:notify(message, level)

        if status == STATUS.FAILURE and params.open_on_failure then
          vim.schedule(
            function()
              overseer.open {
                enter = true,
                direction = "bottom",
              }
            end
          )
        end
      end,
    }
  end,
}
