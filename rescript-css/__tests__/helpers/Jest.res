type asyncDone<'a> = 'a => unit
type expectation<'a>

@val external describe: (string, unit => unit) => unit = "describe"
@val external test: (string, unit => unit) => unit = "test"
@val external testAsync: (string, asyncDone<'a> => unit) => unit = "it"

@val external expect: 'a => expectation<'a> = "expect"
@send external toEqual: (expectation<'a>, 'a) => unit = "toEqual"
@send external toBe: (expectation<'a>, 'a) => unit = "toBe"
