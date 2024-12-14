import { ComponentChildren } from "preact";

export function Element(args: {title: String, children?: ComponentChildren} = {title: "notitle"}) {
  return (
    <div class="card">
      <h1>{args.title}</h1>
      {args.children}
    </div>
  );
};