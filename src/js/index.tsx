import { render } from "preact";

import other from "./other";
import { Element } from "./element";

// Works on IE6
const p = document.createElement('p');
p.innerText = other.toString(); // IE6
// p.textContent = other.toString(); // No IE6
document.body.appendChild(p);

// render() doesn't work on IE6 and would need a custom written renderer.
render(
  <Element title="element">
    <p>subelement</p>
  </Element>,
  document.body);