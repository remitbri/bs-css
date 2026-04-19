open CssJs

global("html, body", [margin(zero), padding(zero), backgroundColor(lavender)])

switch ReactDOM.querySelector("#app") {
| None => ()
| Some(dom) => dom->ReactDOM.Client.createRoot->ReactDOM.Client.Root.render(<Demo />)
}
