<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PreguntaSeguridad
 * 
 * @property int $idPreguntaSeguridad
 * @property string $descripcion
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Usuario[] $usuarios
 *
 * @package App\Models
 */
class PreguntaSeguridad extends Model
{
	protected $table = 'pregunta_seguridad';
	protected $primaryKey = 'idPreguntaSeguridad';
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
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'idPreguntaSeguridad');
	}
}
