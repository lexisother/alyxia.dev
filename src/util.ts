export function timeAgo(date: Date) {
  const DAY_IN_MS = 86400000; // 24 * 60 * 60 * 1000
  const today = new Date();
  const yesterday = new Date(today.getTime() - DAY_IN_MS);
  const seconds = Math.round(today.getTime() - date.getTime());
  const minutes = Math.round(seconds / 60);
  const isToday = today.toDateString() == date.toDateString();
  const isYesterday = yesterday.toDateString() == date.toDateString();
  const isThisYear = today.getFullYear() == date.getFullYear();

  if (seconds < 5) return "now";
  else if (seconds < 60) return `${seconds} seconds ago`;
  else if (seconds < 90) return "about a minute ago";
  else if (minutes < 60) return `${minutes} minutes ago`;
  else if (isToday) {
    let t = date.toLocaleString("en-GB", {
      hour: "2-digit",
      minute: "2-digit",
    });
    return `today at ${t}`;
  } else if (isYesterday) {
    let t = date.toLocaleString("en-GB", {
      hour: "2-digit",
      minute: "2-digit",
    });
    return `yesterday at ${t}`;
  } else if (isThisYear) {
    let d = date.toLocaleString("en-GB", { day: "numeric", month: "long" });
    let t = date.toLocaleString("en-GB", { day: "numeric", minute: "2-digit" });
    return `${d} at ${t}`;
  }

  let d = date.toLocaleString("en-GB", {
    day: "numeric",
    month: "long",
    year: "numeric",
  });
  let t = date.toLocaleString("en-GB", { hour: "2-digit", minute: "2-digit" });
  return `${d} at ${t}`;
}
