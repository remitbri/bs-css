include Css_Legacy_Core
include Css_Colors

include Css_Legacy_Core.Make({
  type styleEncoding = JsxDOMStyle.t
  type renderer = JSON.t // not relevant
  exception NotImplemented

  external unsafeJsonCast: JSON.t => styleEncoding = "%identity"
  external unsafeJsCast: {..} => styleEncoding = "%identity"

  let injectRaw = _ => throw(NotImplemented)
  let renderRaw = (_, _) => throw(NotImplemented)

  let injectRules = (_, _) => throw(NotImplemented)
  let renderRules = (_, _, _) => throw(NotImplemented)

  let mergeStyles = styles =>
    Array.reduce(styles, Object.make(), (acc, item) =>
      Object.assign(acc, Obj.magic(item))
    )->unsafeJsCast

  let make = props => props->unsafeJsonCast

  let makeKeyframes = _ => throw(NotImplemented)
  let renderKeyframes = (_, _) => throw(NotImplemented)
})
