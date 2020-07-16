import * as THREE from 'three';

// Helper function to transform the vertices and faces
export function newTreeGeometry(tree, isTwigs) {
  const output = new THREE.Geometry();

  tree[isTwigs ? 'vertsTwig' : 'verts'].forEach(function (v) {
    output.vertices.push(new THREE.Vector3(v[0], v[1], v[2]));
  });

  const uv = isTwigs ? tree.uvsTwig : tree.UV;
  tree[isTwigs ? 'facesTwig' : 'faces'].forEach(function (f) {
    output.faces.push(new THREE.Face3(f[0], f[1], f[2]));
    output.faceVertexUvs[0].push(f.map(function (v) {
      return new THREE.Vector2(uv[v][0], uv[v][1]);
    }));
  });

  output.computeFaceNormals();
  output.computeVertexNormals(true);

  return output;
}
