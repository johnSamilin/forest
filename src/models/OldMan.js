import React, { memo, useEffect } from 'react'
import { useLoader, useFrame } from 'react-three-fiber'
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader'
import { AnimationMixer, Clock, AnimationClip } from 'three'

import idleAnimationClip from '../animations/idle.json'
import walkAnimationClip from '../animations/walk.json'

export default memo(function PlayerModel(props) {
  const { isWalking = false, speed = 1 } = props;
  const OldMan = useLoader(FBXLoader, '/models/player/BreathingIdle.fbx');
  useEffect(() => {
    OldMan.traverse(o => {
      if (o.isMesh) {
        o.castShadow = true;
        o.receiveShadow = true;
      }
    });
  }, [OldMan]);
  const mixer = new AnimationMixer(OldMan);
  const idleAnimation = mixer.clipAction(AnimationClip.parse(idleAnimationClip));
  const walkAnimation = mixer.clipAction(AnimationClip.parse(walkAnimationClip));
  walkAnimation.timeScale = speed;


  useEffect(() => {
    if (isWalking) {
      idleAnimation.stop();
      walkAnimation.play();
    } else {
      walkAnimation.stop();
      idleAnimation.play();
    }
  }, [isWalking]);

  const clock = new Clock();
  useFrame(() => {
    const delta = clock.getDelta();
    mixer.update(delta);
  });

  return <primitive {...props} object={OldMan} scale={[0.0075, 0.0075, 0.0075]} position={[0, -0.5, 0]} attach="target" />;
});
