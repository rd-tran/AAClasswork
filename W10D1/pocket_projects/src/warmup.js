
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const p = document.createElement('p');
  p.textContent = string;

  if (htmlElement.childNodes[0]) {
    let children = htmlElement.childNodes;

    for (let i = 0; i < children.length; i++) {
      htmlElement.removeChild(children[i]);
    }
  }

  htmlElement.appendChild(p);
};