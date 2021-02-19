export const PLAYERS_MOVEMENT = 'players movement';
export const PLAYERS_POSITION = 'players position';

export function movePlayer(playerId, path) {
  return {
    type: PLAYERS_MOVEMENT,
    payload: {
      playerId,
      path,
    }
  }
}
export function setPlayerPosition(playerId, position) {
  return {
    type: PLAYERS_POSITION,
    payload: {
      playerId,
      position,
    }
  }
}

export function playersReducer(state, { type, payload }) {
  let data = state.movement[payload.playerId];
  switch (type) {
    case PLAYERS_MOVEMENT:
      data = payload.path;
      return {
        ...state,
        movement: {
          ...state.movement,
          [payload.playerId]: data,
        }
      };
    case PLAYERS_POSITION:
      data = payload.position;
      return {
        ...state,
        position: {
          ...state.position,
          [payload.playerId]: data,
        }
      };
    default:
      console.error({ type, payload });
  }
}
