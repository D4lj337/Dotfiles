return {
	enabled = false,
	"j-hui/fidget.nvim",
	opts = {
		text = {
			spinner = "moon", -- Use the 'moon' ASCII spinner animation
			done = "✔",
			commenced = "Started",
			completed = "Completed",
		},
		align = {
			bottom = true,
			right = true,
		},
		timer = {
			spinner_rate = 100,
			fidget_decay = 1000,
			task_decay = 5000,
		},
		fmt = {
			leftpad = true,
			stack_upwards = false,
			max_width = 0,
		},
		window = {
			blend = 0,
			relative = "win",
			border = "rounded",
			zindex = nil,
		},
	},
}
