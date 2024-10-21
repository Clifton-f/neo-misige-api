<?php

namespace Modules\Avaliacoes\Policies;

use Illuminate\Auth\Access\Response;
use Modules\Auth\Models\User;
use Modules\Avaliacoes\Models\AvaliacaoNota;

class AvaliacaoNotaPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, AvaliacaoNota $avaliacaoNota): bool
    {
        //
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, AvaliacaoNota $avaliacaoNota): bool
    {
        //
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, AvaliacaoNota $avaliacaoNota): bool
    {
        //
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, AvaliacaoNota $avaliacaoNota): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, AvaliacaoNota $avaliacaoNota): bool
    {
        //
    }
}
