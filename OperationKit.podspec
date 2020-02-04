Pod::Spec.new do |s|
  s.name             = 'OperationKit'
  s.version          = '1.0.1'
  s.summary          = 'AsyncOperation classes and protocols'

  s.description      = <<-DESC
A set of classes and protocols for compounding, linking, buffering and chaining AsyncOperations.
                       DESC

  s.homepage         = 'https://github.com/viveron/OperationKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'viveron' => 'shabanov.dev.git@gmail.com' }
  s.source           = { :git => 'https://github.com/viveron/OperationKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.swift_version = '5.0'
  s.source_files = 'OperationKit/Classes/**/*'
end
