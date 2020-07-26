<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pais
 * 
 * @property int $idPais
 * @property string $descripcion
 * @property Carbon $fechaCreacion
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Estado[] $estados
 *
 * @package App\Models
 */
class Pais extends Model
{
	protected $table = 'pais';
	protected $primaryKey = 'idPais';
	public $timestamps = false;

	protected $casts = [
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'fechaCreacion',
		'estado',
		'activo'
	];

	public function estados()
	{
		return $this->hasMany(Estado::class, 'idPais');
	}
}
