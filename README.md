# HealthKit Step Count App

This iOS application uses HealthKit to access step count data and displays it in a user-friendly manner.

## Design Choices

The application follows a simple design with a single view controller that displays the step count in a UILabel. The step count is fetched using HealthKit's HKHealthStore and a HKStatisticsQuery.

- Upon launching the app, the `requestAuthorization` method is called to request the user's permission to access step count data through HealthKit.
- If authorization is granted, the `fetchStepCount` method is called to retrieve the step count for the past 24 hours.
- The step count is then displayed in the UILabel.
- If authorization is denied or an error occurs during data retrieval, appropriate error messages are displayed in the UILabel.

## Difficulties Encountered

- One difficulty I encountered was handling errors and authorization status when requesting access to HealthKit. I made sure to handle different scenarios, such as success, failure, and errors, and display appropriate messages to the user.
- Another challenge was calculating the step count for the past 24 hours using a HKStatisticsQuery. I used the start of the day as the start date and the current date as the end date to fetch the cumulative sum of step count samples within that range.

## Instructions

1. Clone or download the project from the repository.
2. Open the project in Xcode.
3. Connect your iOS device to your Mac.
4. Select your connected device as the build destination in Xcode.
5. Build and run the project on your device.
6. Grant the necessary permissions when prompted.
7. The step count for the past 24 hours will be displayed in the app's view.

Make sure to have a valid Apple Developer account and a provisioning profile for your device. If there are any code signing issues, please resolve them in Xcode's project settings.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.0+
