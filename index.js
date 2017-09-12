/**
 * Created by cy on 2017/9/12.
 */
const { NativeModules } = require('react-native');
const { CalendarManager } = NativeModules;


const nativeFunc = {

    /**
     pass someone's name to native

     @param name someone's name
     @return someone's name
     */
    addEventOne: function addEventOne(name) {
        return CalendarManager.addEventOne(name);
    },

    /**
     pass someone's name and details to native

     @param name someone's name
     @param details someone's details, eg. address, age, sex and so on.
     @return
     */
    addEventTwo: function addEventTwo(name, details) {
        return CalendarManager.addEventTwo(name, details);
    },

    /**
     pass someone's name and date to native

     @param name someone's name
     @param date current date
     @return
     */
    addEventThree: function addEventThree(name, date) {
        return CalendarManager.addEventThree(name, date);
    },

    /**
     pass someone's name to native and callback to react-native

     @param name someone's name
     @param callback pass value to react-native from native
     @return
     */
    testCallbackEventOne: function testCallbackEventOne(name, callback) {
        return CalendarManager.testCallbackEventOne(name, callback)
    },
}


module.exports = {
    ...CalendarManager,
    ...nativeFunc,
}