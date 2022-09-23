### Haystack Assessment

## Description 
This repo contains the proposed solution for the ios challenge. 

## Images

| Init View  | Search View   |  Search View  | Result View  | Error View |
|---|---|---|---| ---|
| ![Simulator Screen Shot - Apple TV 4K (at 1080p) (2nd generation) - 2022-09-22 at 21 10 09](https://user-images.githubusercontent.com/1470487/191872049-055db8b1-57de-4e16-988c-12843785dbaf.png)  | ![Simulator Screen Shot - Apple TV 4K (at 1080p) (2nd generation) - 2022-09-22 at 21 10 14](https://user-images.githubusercontent.com/1470487/191872076-55fc4b6a-72a0-4ba2-9d81-6370edcdb4ca.png)  | ![Simulator Screen Shot - Apple TV 4K (at 1080p) (2nd generation) - 2022-09-22 at 21 10 26](https://user-images.githubusercontent.com/1470487/191872097-00583a84-2e86-48e6-9c77-261616ce8e9b.png)  | ![Simulator Screen Shot - Apple TV 4K (at 1080p) (2nd generation) - 2022-09-22 at 21 10 32](https://user-images.githubusercontent.com/1470487/191872133-cbe2b742-aaf7-4199-876e-a16f60374acc.png)  | ![Simulator Screen Shot - Apple TV 4K (at 1080p) (2nd generation) - 2022-09-22 at 21 16 47](https://user-images.githubusercontent.com/1470487/191872327-6cf10477-b2bb-46c1-8b35-638e27d6dd34.png) |


## Video

https://user-images.githubusercontent.com/1470487/191872420-45500950-e5ba-46f0-89a6-38066dcb2745.mp4


## Design patterns. 

For the solution we used MVVM together with the Coordinator pattern. With this we manage everything related to navigation within the app in a simple way. 
At the moment of starting the app a Tab Bar is shown that contains all the screens that were implemented. 


Everything related to the networking part was implemented with a Swift Package Manager developed by me called `JNetworking` which is published on GitHub and is still under development. 

I leave the link [here](https://github.com/jghg02/JNetworking)

## Specifications
- Xcode 13.1
- Swift 5.0 

