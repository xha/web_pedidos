<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoPersona
 * 
 * @property int $idTipoPersona
 * @property string|null $descripcion
 * @property string $nombreTabla
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Persona[] $personas
 *
 * @package App\Models
 */
class TipoPersona extends Model
{
	protected $table = 'tipo_persona';
	protected $primaryKey = 'idTipoPersona';
	public $timestamps = false;

	protected $casts = [
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'nombreTabla',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function personas()
	{
		return $this->hasMany(Persona::class, 'idTipoPersona');
	}
}
