import React from 'react';
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form'
import { receiveTodo } from '../../actions/todo_actions'

const TodoList = ({ todos }) => {
  const items = todos.map( (ele) => {
    return <TodoListItem key={ele.id} todo={ele}/>; 
  });

  return (
    <ul>
      <TodoForm receiveTodo={receiveTodo} />
      <br/>
      {items}
    </ul>
  );
};

export default TodoList;