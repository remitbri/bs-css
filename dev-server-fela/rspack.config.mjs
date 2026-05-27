import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { defineConfig } from "@rspack/cli";
import { rspack } from "@rspack/core";
import { ReactRefreshRspackPlugin } from "@rspack/plugin-react-refresh";

const __dirname = dirname(fileURLToPath(import.meta.url));

export default defineConfig({
  context: __dirname,
  entry: {
    main: "./lib/es6/src/App.mjs",
  },
  resolve: {
    extensions: [".js"],
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        use: [
          {
            loader: "builtin:swc-loader",
            options: {
              jsc: {
                parser: {
                  syntax: "typescript",
                  tsx: true,
                },
                transform: {
                  react: {
                    runtime: "automatic",
                    development: true,
                    refresh: true,
                  },
                },
              },
            },
          },
        ],
      },
    ],
  },
  devServer: {
    static: [
      {
        directory: join(__dirname, "../www"),
      },
    ],
  },
  plugins: [
    new rspack.HtmlRspackPlugin({ template: "../www/index.html" }),
    new ReactRefreshRspackPlugin(),
  ],
});
