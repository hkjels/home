function sanetize(str) {
  return str.toLowerCase().replace(/[^a-z]+/g, "_");
}

function DOMReady() {
  let headings = [].slice.call(document.querySelectorAll("h2"));
  headings.forEach((heading) => {
    let className = sanetize(heading.innerText);
    heading.classList.add(className);
  });
}

addEventListener('DOMContentLoaded', DOMReady);
