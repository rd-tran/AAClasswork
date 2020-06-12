import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);
  
  switch(action.type) {
    case RECEIVE_TODOS:
      for (let i = 0; i < action.todos.length; i++) {
        nextState[action.todos[i].id] = action.todos[i]
      }
      
      return nextState
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState
    default: 
      return nextState;
      // return state
  }
};

export default todosReducer;

/**
 * Convert this array
 * [
 *   {id: 1, information1: 'asdf', information2: 'asdfasdf'},
 *   {id: 2, information1: 'asdf', information2: 'asdfasdf'},
 *   {id: 3, information1: 'asdf', information2: 'asdfasdf'},
 *   {id: 4, information1: 'asdf', information2: 'asdfasdf'},
 * ]
 * 
 * Into this object
 * {
 *   1: {
 *     id: 1,
 *     information1: 'asdf',
 *     information2: 'asdfasdf'
 *   },
 * 
 *   2: {
 *     id: 2,
 *     information1: 'asdf',
 *     information2: 'asdfasdf'
 *   },
 * 
 *   3: {
 *     id: 3,
 *     information1: 'asdf',
 *     information2: 'asdfasdf'
 *   },
 *   
 *   4: {
 *     id: 4,
 *     information1: 'asdf',
 *     information2: 'asdfasdf'
 *   },
 * }
 */
// export const addShirt = (shirt) => {
//     return  {
//         type: ADD_SHIRT,
//         shirt: shirt
//     }
// }