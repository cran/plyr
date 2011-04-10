context("Rename")

test_that("No match leaves names unchanged", {
  x <- c(a = 1, b = 2, c = 3, 4)
  y <- rename(x, c(d = "e"))
  
  expect_equal(names(x), names(y))
})

test_that("Single name match makes change", {
  x <- c(a = 1, b = 2)
  y <- rename(x, c(b = "c"))
  
  expect_equal(names(y), c("a", "c"))
})