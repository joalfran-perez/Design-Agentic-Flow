# Gotcha: unresolved `VARIABLE_ALIAS` values

**Symptom:** A variable's resolved value comes back as `{type: 'VARIABLE_ALIAS', id: '...'}` instead of a
final hex/number/string — happens especially with base-palette shades referenced by semantic tokens.

**Fix:** Write a small recursive resolver before formatting/returning any variable value:
```js
async function resolve(value) {
  if (value && value.type === 'VARIABLE_ALIAS') {
    const v = await figma.variables.getVariableByIdAsync(value.id);
    const modeId = Object.keys(v.valuesByMode)[0];
    return resolve(v.valuesByMode[modeId]);
  }
  return value;
}
```
Chain until a primitive (color object, number, boolean, string) is reached — alias chains can be more than
one level deep. Always resolve before converting colors to hex.
