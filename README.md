
# react-native-geo-package

## Getting started

`$ npm install react-native-geo-package --save`

### Mostly automatic installation

`$ react-native link react-native-geo-package`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-geo-package` and add `RNGeoPackage.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNGeoPackage.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNGeoPackagePackage;` to the imports at the top of the file
  - Add `new RNGeoPackagePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-geo-package'
  	project(':react-native-geo-package').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-geo-package/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-geo-package')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNGeoPackage.sln` in `node_modules/react-native-geo-package/windows/RNGeoPackage.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Geo.Package.RNGeoPackage;` to the usings at the top of the file
  - Add `new RNGeoPackagePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNGeoPackage from 'react-native-geo-package';

// TODO: What to do with the module?
RNGeoPackage;
```
  