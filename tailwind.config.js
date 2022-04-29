module.exports = {
  content: [
	  "./views/**/*.cfm",
	  "./layouts/**/*.cfm",
	  "./modules_app/**/views/**/*.cfm",
	  "./modules_app/**/layouts/**/*.cfm"
  ],
  theme: {
    extend: {},
  },
  plugins: [
	  require("@tailwindcss/forms")
  ],
}
