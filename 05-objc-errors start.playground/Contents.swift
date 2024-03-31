// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

enum PlainError: Int, Error {
  case boom = 100
  case bam
}

enum FancyError: Error {
  case kazam(String)
}

print("Example 1")

do {
	throw PlainError.bam
} catch let error as NSError {
	dump(error)
}

print("Example 2")

do {
	throw FancyError.kazam("Hello")
} catch let error as NSError {
	dump(error)
}

print("Example 3")
do {
	let file = try FileHandle(forReadingFrom: URL(fileURLWithPath: "sdf"))
} catch let error as NSError {
	dump(error)
}


