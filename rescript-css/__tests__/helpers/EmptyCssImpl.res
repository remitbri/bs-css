exception NotImplemented

module New = {
  include Css_Colors
  include Css_Js_Core
  include Css_Js_Core.Make({
    type styleEncoding = string
    type renderer = JSON.t

    let injectRaw = _ => throw(NotImplemented)
    let renderRaw = (_, _) => throw(NotImplemented)
    let injectRules = (_, _) => throw(NotImplemented)
    let renderRules = (_, _, _) => throw(NotImplemented)
    let make = _ => throw(NotImplemented)
    let mergeStyles = _ => throw(NotImplemented)
    let makeKeyframes = _ => throw(NotImplemented)
    let renderKeyframes = (_, _) => throw(NotImplemented)
  })
}

module Legacy = {
  include Css_Colors
  include Css_Legacy_Core
  include Css_Legacy_Core.Make({
    type styleEncoding = string
    type renderer = JSON.t

    let injectRaw = _ => throw(NotImplemented)
    let renderRaw = (_, _) => throw(NotImplemented)
    let injectRules = (_, _) => throw(NotImplemented)
    let renderRules = (_, _, _) => throw(NotImplemented)
    let make = _ => throw(NotImplemented)
    let mergeStyles = _ => throw(NotImplemented)
    let makeKeyframes = _ => throw(NotImplemented)
    let renderKeyframes = (_, _) => throw(NotImplemented)
  })
}
