switch ReactDOM.querySelector("#app") {
| None => ()
| Some(dom) => dom->ReactDOM.Client.createRoot->ReactDOM.Client.Root.render(<Demo />)
}
