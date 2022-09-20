//
//  DataBiding.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 09-09-22.
//

final class DataBiding<T> {

  typealias Listener = (T) -> Void
  var listener: Listener?

  var value: T {
    didSet {
      listener?(value)
    }
  }

  init(_ value: T) {
    self.value = value
  }

  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}

