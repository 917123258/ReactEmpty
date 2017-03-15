import { createStore } from 'redux'
import rootReducer from '../reducers/root'

export default function rootStore(initState){
    return createStore(rootReducer,initState);
}