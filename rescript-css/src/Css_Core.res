module type CssImplementationIntf = {
  type styleEncoding
  type renderer // some implementations might need a renderer

  let injectRaw: string /* css */ => unit
  let renderRaw: (renderer, string /* css */) => unit

  let injectRules: (string /* selector */, JSON.t) => unit
  let renderRules: (renderer, string /* selector */, JSON.t) => unit

  let make: JSON.t => styleEncoding
  let mergeStyles: array<styleEncoding> => styleEncoding

  let makeKeyframes: dict<JSON.t> => string /* animationName */
  let renderKeyframes: (renderer, dict<JSON.t>) => string /* animationName */
}
