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

target 'balaiternak' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for balaiternak
  rx_cocoa
  rx_swift

  target 'balaiternakTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'balaiternakDomain' do
  use_frameworks!
  # Pods for balaiternakDomain
  rx_swift
  
  target 'balaiternakDomainTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end


target 'balaiternakData' do
  use_frameworks!
  # Pods for balaiternakData
  rx_swift
  
  target 'balaiternakDataTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'balaiternakCache' do
  use_frameworks!
  # Pods for balaiternakCache
  rx_swift
  
  target 'balaiternakCacheTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'balaiternakPresentation' do
  use_frameworks!
  # Pods for balaiternakPresentation
  rx_swift
  
  target 'balaiternakPresentationTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

target 'balaiternakRemote' do
  use_frameworks!
  # Pods for balaiternakRemote
  rx_swift
  pod 'Alamofire'
  pod 'RxAlamofire'
  
  target 'balaiternakRemoteTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end
end

