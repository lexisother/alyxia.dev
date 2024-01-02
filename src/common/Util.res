module Unsafe = {
  external elementAsString: React.element => string = "%identity"
}

module String = {
  let camelCase: string => string = %raw("str => {
     return str.replace(/-([a-z])/g, function (g) { return g[1].toUpperCase(); });
    }")

  let capitalize: string => string = %raw("str => {
      return str && str.charAt(0).toUpperCase() + str.substring(1);
    }")
}

module Url = {
  let isAbsolute: string => bool = %raw(`
    function(str) {
      var r = new RegExp('^(?:[a-z]+:)?//', 'i');
      if (r.test(str))
      {
        return true
      }
      return false;
    }
  `)
}

module Date = {
  let timeAgo = (date: Date.t): string => {
    open Float
    open Date

    let dateInMs = date->Date.getTime
    let dayInMs = 86400000. // 24 * 60 * 60 * 1000
    let today = Date.make()
    let yesterday = Date.fromTime(today->getTime -. dayInMs)
    let seconds = Math.round((today->getTime -. dateInMs) /. 1000.)->toInt
    let minutes = Math.round(Int.toFloat(seconds / 60))->toInt
    let isToday = today->toDateString == date->toDateString
    let isYesterday = yesterday->toDateString == date->toDateString
    let isThisYear = today->getFullYear == date->getFullYear

    if seconds < 5 {
      "now"
    } else if seconds < 60 {
      `${seconds->Int.toString} seconds ago`
    } else if seconds < 90 {
      "about a minute ago"
    } else if minutes < 60 {
      `${minutes->Int.toString} minutes ago`
    } else if isToday {
      let t =
        date->toLocaleStringWithLocaleAndOptions("en-US", {hour: #"2-digit", minute: #"2-digit"})
      `today at ${t}`
    } else if isYesterday {
      let t =
        date->toLocaleStringWithLocaleAndOptions("en-US", {hour: #"2-digit", minute: #"2-digit"})
      `yesterday at ${t}`
    } else if isThisYear {
      let d = date->toLocaleStringWithLocaleAndOptions("en-US", {day: #numeric, month: #long})
      let t =
        date->toLocaleStringWithLocaleAndOptions("en-US", {hour: #"2-digit", minute: #"2-digit"})
      `${d} at ${t}`
    } else {
      let d =
        date->toLocaleStringWithLocaleAndOptions(
          "en-US",
          {day: #numeric, month: #long, year: #numeric},
        )
      let t =
        date->toLocaleStringWithLocaleAndOptions("en-US", {hour: #"2-digit", minute: #"2-digit"})
      `${d} at ${t}`
    }
  }
}
