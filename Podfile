# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
  pod 'RxSwift', '~> 5.0'
end

def rx_cocoa
  pod 'RxCocoa', '~> 5.0'
end

def test_pods
  pod 'RxTest'
  pod 'RxBlocking'
end

target 'cleanswift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for cleanswift
  rx_cocoa
  rx_swift

  target 'cleanswiftTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'cleanswiftDomain' do
  use_frameworks!
  # Pods for cleanswiftDomain
  rx_swift
  
  target 'cleanswiftDomainTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end


target 'cleanswiftData' do
  use_frameworks!
  # Pods for cleanswiftData
  rx_swift
  
  target 'cleanswiftDataTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'cleanswiftCache' do
  use_frameworks!
  # Pods for cleanswiftCache
  rx_swift
  
  target 'cleanswiftCacheTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'cleanswiftPresentation' do
  use_frameworks!
  # Pods for cleanswiftPresentation
  rx_swift
  
  target 'cleanswiftPresentationTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'cleanswiftRemote' do
  use_frameworks!
  # Pods for cleanswiftRemote
  rx_swift
  pod 'Alamofire'
  pod 'RxAlamofire'
  
  target 'cleanswiftRemoteTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

