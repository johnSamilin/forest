import React, { memo, useEffect } from 'react'
import { useLoader, useFrame } from 'react-three-fiber'
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader'
import { AnimationMixer, Clock } from 'three';

export default memo(function PlayerModel(props) {
  const { isWalking = false } = props;
  const Abe = useLoader(FBXLoader, '/models/player/BreathingIdle.fbx');
  const AbeWalking = useLoader(FBXLoader, '/models/player/WalkForward.fbx');
  Abe.traverse(o => {
    if (o.isMesh) {
      o.castShadow = true;
      o.receiveShadow = true;
    }
  });
  const mixer = new AnimationMixer(Abe);
  const idleAnimation = mixer.clipAction(Abe.animations[0]);
  const walkAnimation = mixer.clipAction(AbeWalking.animations[0]);
  
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

  return <group {...props}>
    <primitive object={Abe} scale={[0.0075, 0.0075, 0.0075]} position={[0, -0.5, 0]} attach="target" />
  </group>;
});
