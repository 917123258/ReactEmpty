import { combineReducers } from 'redux'
import light from './light/'
import count from './counter/'
const rootReducer = combineReducers({
    test,
    light,
    count
});

export default rootReducer