module.exports = {
    extends: [
        "eslint:recommended",
        "plugin:@typescript-eslint/recommended",
    ],
    ignorePatterns: [
        ".eslintrc.js",
        "copy-assets.js",
        "dist/**"
    ],
    parser: "@typescript-eslint/parser",
    parserOptions: {
        ecmaVersion: 12,
        sourceType: "module",
        project: [
            "./tsconfig.json",
        ],
    },
    env: {
        node: true,
    },
    plugins: [
        "@typescript-eslint",
    ],
    rules: {
        "@typescript-eslint/no-unused-vars": [ 2, { argsIgnorePattern: "(^_|req|res|next)" } ]
    }
}
