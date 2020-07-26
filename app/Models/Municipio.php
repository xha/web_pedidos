<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Municipio
 * 
 * @property int $idMunicipio
 * @property string $descripcion
 * @property int $idEstado
 * @property Carbon $fechaCreacion
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Ubicacion[] $ubicacions
 *
 * @package App\Models
 */
class Municipio extends Model
{
	protected $table = 'municipio';
	protected $primaryKey = 'idMunicipio';
	public $timestamps = false;

	protected $casts = [
		'idEstado' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'idEstado',
		'fechaCreacion',
		'estado',
		'activo'
	];

	public function estado()
	{
		return $this->belongsTo(Estado::class, 'idEstado');
	}

	public function ubicacions()
	{
		return $this->hasMany(Ubicacion::class, 'idMunicipio');
	}
}
