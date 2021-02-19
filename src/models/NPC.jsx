import React, { memo, useEffect, useMemo, useState } from 'react'
import { useLoader, useFrame } from 'react-three-fiber'
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader'
import { AnimationMixer, Clock, AnimationClip, Object3D } from 'three'

import idleAnimation from '../animations/idle-arm-stretching.json'
import walkAnimation from '../animations/walk.json'

const idleClip = AnimationClip.parse(idleAnimation);
const walkClip = AnimationClip.parse(walkAnimation);

function useGetModel(path, id) {
  const [instance, setInstance] = useState(new Object3D());
  const loader = new FBXLoader();
  useEffect(() => {
    loader.loadAsync(`/models/${path}.fbx`).then((group) => {
      setInstance(group);
    });
  }, [id, path]);
  useEffect(() => {
    instance.traverse(o => {
      if (o.isMesh) {
        o.castShadow = true;
        o.receiveShadow = true;
      }
    });
  }, [instance]);

  return instance;
}

function NPCComponent({ id, ...props }) {
  const { isWalking = false, speed = 1, model } = props;
  const instance = useGetModel(model, id);

  const mixer = new AnimationMixer(instance);
  const idleAnimation = mixer.clipAction(idleClip);
  const walkAnimation = mixer.clipAction(walkClip);
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

  useMemo(() => {    
    idleAnimation.play();
  }, [instance]);

  const clock = new Clock();
  useFrame(() => {
    const delta = clock.getDelta();
    mixer.update(delta);
  });

  return <primitive {...props} object={instance} scale={[0.05, 0.05, 0.05]} position={[0, -0.5, 0]} />;
}

export const NPC = memo(NPCComponent);
