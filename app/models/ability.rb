# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    if user.nil?
      can :read, [Category, Article]
    elsif user.roles.pluck(:title).include? "admin"
      can :manage, [Category, Article, Comment]
    elsif user.roles.pluck(:title).include? "moderator"
      can :read, [Category, Article, Comment]
      can :create, Comment
      can :destroy, Comment
    elsif user.roles.pluck(:title).include? "author" 
      can :read, [Category, Article, Comment]
      can :create, Article 
      can [:update, :destroy], Article do |art|
      art.article.user_id == user.id
      end
      can :destroy, Comment do |c|
      c.article.user_id == user.id
      end
    elsif user.roles.pluck(:title).include? "user" 
      can :read, [Category, Article, Comment]
      can [:read, :create], Comment
      can [:update, :destroy], Comment do |comment|
      comment.user_id == user.id
      end
    end
    end
      
  end

  