tests
testMatrixInversionSmall
	"it is here since it uses random matrices"

	| m c i |
	c := DhbSymmetricMatrix identity: 5.
	3
		timesRepeat: [ [ m := DhbSymmetricMatrix new: 5 random: 20.
			m determinant = 0 ] whileTrue.	"singular matrix not allowed"
			self assert: (i := m crlInverse) * m equals: c.
			self assert: i class equals: DhbSymmetricMatrix.
			self assert: (i := m inversePureLUP) * m equals: c.
			self assert: i class equals: DhbSymmetricMatrix.
			self assert: m * (i := m inversePureCRL) equals: c.
			self assert: i class equals: DhbSymmetricMatrix ].
	3
		timesRepeat: [ [ m := DhbMatrix rows: 5 columns: 5 random: 20.
			m determinant = 0 ] whileTrue.
			self assert: m * (i := m inverse) equals: c.
			self assert: i class equals: DhbMatrix.
			self assert: (i := m inversePureCRL) * m equals: c.
			self assert: i class equals: DhbMatrix ]