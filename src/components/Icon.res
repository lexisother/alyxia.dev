module ArrowRight = {
  @react.component
  let make = (~className: string="") =>
    <svg
      className={"fill-current " ++ className} width="18" height="11.769" viewBox="0 0 18 11.769">
      <defs>
        <clipPath id="prefix__a">
          <path
            d="M12.121-16.823a.67.67 0 00-.907 0 .566.566 0 000 .835l4.6 4.277H.635A.611.611 0 000-11.12a.617.617 0 00.635.6h15.179l-4.6 4.269a.576.576 0 000 .844.67.67 0 00.907 0L17.81-10.7a.553.553 0 000-.835z"
            transform="translate(0 17)"
            clipRule="evenodd"
            fill="current"
          />
        </clipPath>
        <clipPath id="prefix__b">
          <path
            className="prefix__b"
            d="M-297 336.231h747.692V-534H-297z"
            transform="translate(297 534)"
          />
        </clipPath>
      </defs>
      <g clipPath="url(#prefix__a)">
        <g transform="translate(-205.615 -357.923)" clipPath="url(#prefix__b)">
          <path className="prefix__b" d="M202.154 354.462h24.923v18.692h-24.923z" />
        </g>
      </g>
    </svg>
}

module Hyperlink = {
  @react.component
  let make = (~className: string="") =>
    <svg
      className={"fill-current " ++ className}
      width="0.8em"
      height="0.8em"
      viewBox="0 0 20.003 19.944">
      <path
        d="M11.927 7.908a4.819 4.819 0 00-3.968-1.3 5.091 5.091 0 00-2.921 1.508L1.47 11.684a4.82 4.82 0 00.192 7.122 4.994 4.994 0 006.76-.4l3.7-3.776a.109.109 0 00-.067-.184s-.649.029-1.132.006a10.116 10.116 0 01-1.35-.226.308.308 0 00-.243.088l-2.529 2.609a2.733 2.733 0 01-3.583.319 2.64 2.64 0 01-.247-3.951l3.755-3.753a2.7 2.7 0 013.654-.073.108.108 0 00.15 0l1.4-1.4a.114.114 0 00-.003-.157z"
      />
      <path
        d="M8.076 12.036a4.822 4.822 0 003.967 1.3 5.089 5.089 0 002.922-1.509l3.568-3.568a4.818 4.818 0 00-.192-7.121 5 5 0 00-6.761.4l-3.7 3.777a.108.108 0 00.067.183s.648-.028 1.132-.006a10.151 10.151 0 011.35.226.3.3 0 00.243-.088l2.529-2.608a2.732 2.732 0 013.581-.319 2.638 2.638 0 01.249 3.95l-3.755 3.754a2.706 2.706 0 01-3.654.073.107.107 0 00-.15 0l-1.4 1.4a.113.113 0 00.004.156z"
      />
    </svg>
}
