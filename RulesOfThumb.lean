import Mathlib
import Mathlib.Data.Set.Defs

/-

This Lean file illustrates various scenarious you might encounter during a proof and how to deal with them.

-/

variable (P : ℕ → Prop)

-- Existential quantifier in the goal

example : ∃ x, x = 1 := by
  use 1

example : ∃ x, P x := by
  use 1
  sorry

-- Universal quantifier in the goal

example : ∀ x, P x := by
  intro x
  sorry

-- Existential quantifier in a hypothesis

example (h : ∃ x : ℕ, P x) : True := by
  obtain ⟨x, hx⟩ := h
  sorry

example (h : ∃ x : ℕ, P x) : True := by
  let ⟨x, hx⟩ := h
  sorry

example (h : ∃ x : ℕ, P x) : True := by
  rcases h with ⟨x, hx⟩
  sorry

-- Universal quantifier in a hypothesis

example (h : ∀ x : ℕ, P x) : True := by
  specialize h 42
  sorry

example (h : ∀ x : ℕ, P x) : True := by
  have ha := h 42
  sorry

-- Implication in the goal

example (a b : Prop) : a → b := by
  intro h
  show b
  sorry

-- Equivalence in the goal

example (a b : Prop) : a ↔ b := by
  constructor
  · show a → b
    sorry
  · show b → a
    sorry

-- Conjuction in the goal

example (a b : Prop) : a ∧ b := by
  constructor
  · show a
    sorry
  · show b
    sorry

-- Conjuction in the goal (use a hypothesis)

example (a b : Prop) (ha : a) : a ∧ b := by
  use ha
  show b
  sorry

-- Disjunction in the goal

example (a b : Prop) : a ∨ b := by
  left
  show a
  sorry

-- Various scenarious involving sets

variable (α : Type)

example (s t : Set α) : s ⊆ t := by
  intro x xs
  sorry

example (s : Set α) (f : α → α) (y : α) (h : y ∈ f '' s) : y ∈ s := by
  rcases h with ⟨x, xs, fx⟩
  sorry

example (s : Set α) (f : α → α) (y : α) (x : α) (fx : f x = y) (xs : x ∈ s) : y ∈ f '' s:= by
  use x

example (s : Set α) (f : α → α) (y : α) (x : α) : y ∈ f '' s:= by
  use x
  sorry

example (s : Set α) (f : α → α) (y : α) (p : Prop) : y ∈ f '' s → p:= by
  rintro ⟨x, xs, fx⟩
  sorry

example (f : α → α) (h : ∀ a₁ a₂, f a₁ = f a₂ → a₁ = a₂) : f.Injective := by
  exact h

example (s t : Set α) : s = t := by
  ext x
  sorry

example (x : α) (s t : Set α) (p : Prop): x ∈ s ∪ t → p := by
  rintro (xs | xt)
  · sorry
  · sorry
