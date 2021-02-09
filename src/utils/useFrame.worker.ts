/* eslint-disable no-restricted-globals */
const ctx: Worker = self as any;

let lastTime: number;
let scheduleNextCall = true;

function tick() {
  const currentTime = performance.now();
  ctx.postMessage({
    useFrame: {
      delta: (currentTime - lastTime) / 1000, // in seconds
    },
  });
  lastTime = currentTime;
  if (scheduleNextCall) {
    requestAnimationFrame(tick);
  }
}

// Respond to message from parent thread
ctx.addEventListener("message", (e) => {
  if (!e.data.useFrame) {
    return;
  }
  if (e.data.useFrame.enabled) {
    scheduleNextCall = true;
    lastTime = performance.now();
    tick();
  } else {
    scheduleNextCall = false;
  }
});

export default {} as typeof Worker & (new () => Worker);
