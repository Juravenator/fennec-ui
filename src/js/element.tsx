import { ComponentChildren } from "preact";

// interface ElementParams {
//   title: string;
//   children: ComponentChildren;
// }

export function Element(title: String, children: ComponentChildren = []) {
  return (
    <div class="card">
      <h1>{title}</h1>
      {children}
    </div>
  );
};