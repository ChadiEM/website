module.exports = {
  plugins: [
    require("postcss-purgecss")({
      content: ["./website/**/*.html"],
    }),
    require("cssnano")({
      preset: "default",
    }),
  ],
};
