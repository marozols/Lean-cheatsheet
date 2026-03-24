import Mathlib
import Mathlib.Data.Set.Defs

-- Existential quantifier in goal
example : ∃ x, x = 1 := by
  use 1

example (f : ℕ → Prop) : ∃ x, f x := by
  use 1
  sorry

-- Universal quantifier in goal
example (f : ℕ → Prop) : ∀ x, f x := by
  intro x
  sorry

-- Existential quantifier in hypothesis
example (P : ℝ → Prop) (h : ∃ x : ℝ, P x) : True := by
  obtain ⟨x, hx⟩ := h
  sorry

example (P : ℝ → Prop) (h : ∃ x : ℝ, P x) : True := by
  let ⟨x, hx⟩ := h
  sorry

example (P : ℝ → Prop) (h : ∃ x : ℝ, P x) : True := by
  rcases h with ⟨x, hx⟩
  sorry

-- Universal quantifier in hypothesis
example (P : ℝ → Prop) (h : ∀ x : ℝ, P x) : True := by
  specialize h 42
  sorry

example (P : ℝ → Prop) (h : ∀ x : ℝ, P x) : True := by
  have ha := h 42
  sorry

-- Implication in goal
example (a b : Prop) : a → b := by
  intro h
  show b
  sorry

-- Equivalence in goal
example (a b : Prop) : a ↔ b := by
  constructor
  · show a → b
    sorry
  · show b → a
    sorry

-- Conjuction in goal
example (a b : Prop) : a ∧ b := by
  constructor
  · show a
    sorry
  · show b
    sorry

-- Conjuction in goal (use a hypothesis)
example (a b : Prop) (ha : a) : a ∧ b := by
  use ha
  show b
  sorry

-- Disjunction in goal
example (a b : Prop) : a ∨ b := by
  left
  show a
  sorry

example (α : Type) (s t : Set α) : s ⊆ t := by
  intro x xs
  sorry

example (α : Type) (s : Set α) (f : α → α) (y : α) (h : y ∈ f '' s) : y ∈ s := by
  rcases h with ⟨x, xs, fx⟩
  sorry

example (α : Type) (s : Set α) (f : α → α) (y : α) (x : α) (fx : f x = y) (xs : x ∈ s) : y ∈ f '' s:= by
  use x

example (α : Type) (s : Set α) (f : α → α) (y : α) (x : α) : y ∈ f '' s:= by
  use x
  sorry

example (α : Type) (s : Set α) (f : α → α) (y : α) (p : Prop) : y ∈ f '' s → p:= by
  rintro ⟨x, xs, fx⟩
  sorry

example (α : Type) (f : α → α) (h : ∀ a₁ a₂, f a₁ = f a₂ → a₁ = a₂) : f.Injective := by
  exact h

example (α : Type) (s t : Set α) : s = t := by
  ext x
  sorry

example (α : Type) (x : α) (s t : Set α) (p : Prop): x ∈ s ∪ t → p := by
  rintro (xs | xt)
  · sorry
  · sorry
