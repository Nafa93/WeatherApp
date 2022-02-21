# WeatherApp

# How does it work?

At launch the app will ask you to grant location permissions and it will fetch the weather for your current location displaying it on the screen.

# What if I don't provide permissions?

If you don't provide access to your location the app won't work and it will display an appropiate error message to let you know what it needs.

# What if I don't have internet connection?

If you don't have internet connection an alert will be shown and it if you press "Ok" it will retry the fetch.

# How's the app structured under the hood?

* The app  uses MVVM as it's architecture
* Uses dependy injection with protocols so you can mock the dependencies if you want
* Defines a network layer in order to consume APIs
* Uses CodingKeys to provide better named models instead of using whatever the API provides
* Cosumes the WeatherAPI key from a .plist file

# What can be improved?

* The API key should commited encrypted and decrypted on the build phase
* Should have unit tests to make sure we can refactor as we want without breaking anything

Even though the previous items were not addressed the foundation was laid in a way that those could be easily added if we wanted to extend the app.
