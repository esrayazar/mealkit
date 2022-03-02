package com.coding.meal_kit.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PostPersist;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "likes", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "meal_id"))
	private List<Meal> likedMeals;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "favorites", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "meal_id"))
	private List<Meal> favoritedMeals;
	
	@OneToMany(mappedBy = "reviewedBy", fetch = FetchType.LAZY)
    private List<Review> reviews;
	
	@NotBlank(message="Name is required")
	private String firstName;
	
	@NotBlank
	@Email
	private String email;
	
	@NotBlank(message="Password is required")
	private String password;
	
	@NotBlank(message="Confirm your password")
	@Transient
	private String confirm_password;
	
	@OneToMany(mappedBy = "ratedBy", fetch = FetchType.LAZY)
	private List<Rating> ratings;
	
//	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
//    private List<Review> reviews;
//	

	public List<Rating> getRatings() {
		return ratings;
	}
	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}
	public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm_password() {
		return confirm_password;
	}
	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PostPersist
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	public List<Meal> getLikedMeals() {
		return likedMeals;
	}
	public void setLikedMeals(List<Meal> likedMeals) {
		this.likedMeals = likedMeals;
	}
	public List<Meal> getFavoritedMeals() {
		return favoritedMeals;
	}
	public void setFavoritedMeals(List<Meal> favoritedMeals) {
		this.favoritedMeals = favoritedMeals;
	}
	

}
