// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

enum PlainError: Int, Error {
	case boom = 100
	case bam
}

do {
	throw PlainError.bam
} catch {
	print("Default match", error)
}

enum FancyError: Error {
	case kazam(String)
}

do {
	throw PlainError.bam
} catch (let error as PlainError) {
	print("Basic!", error)
} catch FancyError.kazam(let message) {
	print("Fancy", message)
} catch {
	print(error)
}

do {
	throw FancyError.kazam("with a message")
} catch (let error as PlainError) {
	print("Basic!", error)
} catch FancyError.kazam(let message) {
	print("Fancy", message)
} catch {
	print(error)
}

// View Definition
//DecodingError.typeMismatch(<#T##any Any.Type#>, <#T##DecodingError.Context#>)
