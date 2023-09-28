const hello = "hello";
const world = "world";

export function concat(
  stringa: string,
  stringb: string,
): string {
  return `${stringa} ${stringb}`.trim();
}

const showMessage = (): void => {
  console.log(concat(hello, world));
};

showMessage();
