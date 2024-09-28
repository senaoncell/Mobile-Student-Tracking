 ### FLUTTER and DART UPDATES

* **RaisedButton** is now deprecated in Flutter. You should use **ElevatedButton** instead.

* The primary property is no longer used to color Button components. In newer versions of Flutter, button styles are determined by **ButtonStyle** and old properties such as primary used for buttons have been removed.In the new version, you can set the background color and other styles of buttons with the style parameter, such as **ElevatedButton.styleFrom**. You should use **backgroundColor** instead of **primary**.

*  Due to Dart's **null safety feature**, we need to specify variables like **id** and **status** in case they are null. If we accept that these variables can be null, we should define them with a **?** sign. Otherwise, you will get an error when you try to use them without assigning the id value in the first constructor method.

*  In recent versions of Flutter, the value parameter of the **onSaved** method in the **TextFormField** widget is now **nullable (String?)**

* In Dart, you can use the **this** keyword inside const **constructors**. This allows you to easily set properties and define object instances as constants.

*  Although the new keyword in Dart was previously a mandatory component of an expression used to create an object, in Dart 2.0 and later, the **new** keyword has been made optional. That is, you do not have to use new to create an object in Dart.

### TECHNOLOGIES USED
ANDROID STUDIO




